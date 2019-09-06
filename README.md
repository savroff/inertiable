# Inertable 

This is a simple example adapter for [Inertia.js](https://github.com/inertiajs/inertia)
Ruby on Rails adapter for Inertia.js

## How to use it

You can add concern to your Rails app and then use `inertia` method to render data.

```ruby
class PostsController < ActionController::Base
  include Inertiable
  
  def show
    inertia :dashboard, { store: current_store }
  end
end
```

You can also use shared props data. For that you can use before action:

```ruby
class PostsController < ActionController::Base
  before_action :inject_shared_props
  include Inertiable
  
  def show
    inertia :dashboard, { store: current_store }
  end
  
  private 
  
  def inject_shared_props
    @shared_props = {
      user: current_user,
      project: current_project
    }
  end
end
```
