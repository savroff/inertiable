module Inertiable
  extend ActiveSupport::Concern

  included do
    after_action :inertiable
  end

  def inertiable
    response.set_header('X-Inertia', true) if inertiable?
  end

  def inertiable?
    request.headers['X-Inertia'].present?
  end

  def inertia(component, props = {})
    props = props.merge(@shared_props) if @shared_props
    component_name = component.to_s.capitalize
    data = {
      component: component_name,
      props: props,
      url: request.url
    }
    
    if inertiable?
      render json: data
    else
      html = helpers.tag.div(
        id: 'app',
        data: { page: data.to_json }
      )
      render html: html, layout: true
    end
  end
end
