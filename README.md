## Notes
========

### 1. How to create a new controller in Rails with terminal?
```
rails generate controller <controller_name> <action_name>
```
e.g.
```
rails generate controller welcome index
```

### 2. How to create a new model in Rails with terminal?
```
rails generate model <model_name> <attribute_name>:<attribute_type>
```
e.g.
```
rails generate model Article title:string text:text
```

### 3. How to create a new migration in Rails with terminal?
```
rails generate migration <migration_name>
```
e.g.
```
rails generate migration add_user_id_to_articles
```

### 4. How to run a migration in Rails with terminal?
```
rake db:migrate
```

### 5. How to rollback a migration in Rails with terminal?
```
rake db:rollback
```

### 6. How to add a new column to a table in Rails?
```
rails generate migration add_<column_name>_to_<table_name> <column_name>:<column_type>
```
e.g.
```
rails generate migration add_user_id_to_articles user_id:integer
```

### 7. How to remove a column from a table in Rails?
```
rails generate migration remove_<column_name>_from_<table_name> <column_name>:<column_type>
```
e.g.
```
rails generate migration remove_user_id_from_articles user_id:integer
```

### 8. What is authentication in Rails?
Authentication is the process of identifying the user credentials. It ensures that the user is genuine.

### 9. What is devise gem in Rails?
Devise is a flexible authentication solution for Rails based on Warden. It: 
* Is Rack based;
* Is a complete MVC solution based on Rails engines;
* Allows you to have multiple models signed in at the same time;
* Is based on a modularity concept: use only what you really need.

### 10. How to install devise gem in Rails?
Add the following line to your Gemfile:
```
gem 'devise'
```
Then run the following command to install it:
```
bundle install
```
Next, you need to run the generator:
```
rails generate devise:install
```
The generator will install an initializer which describes ALL Devise's configuration options and you MUST take a look at it. When you are done, you are ready to add Devise to any of your models using the generator:
```
rails generate devise User
```
The generator will create a model with the given name, which inherits from Devise::Models::User. It will also create a migration file for this model, add the necessary columns to your model and configure Devise to use the generated model.

### 11. How to generate devise views in Rails?
```
rails generate devise:views
```

### 12. How to generate devise controllers in Rails?
```
rails generate devise:controllers [scope]
```
e.g.
```
rails generate devise:controllers users
```

### 13. How to generate devise routes in Rails?
```
rails generate devise:routes
```

### 14. How to open credentials.yml.enc file in Rails?
```
EDITOR="code --wait" rails credentials:edit
```

### 15. How to read the credentials in Rails?
```
Rails.application.credentials.<credential_name>
```

### 16. How to create a new many to many relationship resource in Rails?
```
rails g resource <resource_name> <resource_name>:references <resource_name>:references
```
e.g.
```
rails g resource UserStock user:references stock:references
```

### 17. What is self referential association in Rails?
Self referential association is a relationship where a model has a relation to itself. For example, a user can have many friends and a friend can also have many friends.
e.g.
```
class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
end

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
```

### 18. How to create a new self referential association in Rails?
```
rails g model <model_name> <model_name>:references
```
e.g.
```
rails g model Friendship user:references
```


