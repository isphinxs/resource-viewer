# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - Resource has_many Categories and Ratings, and Users through Ratings; Organization has_many Resources; Category has_)many Resources; User has_many Ratings, and Resources through Ratings
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - Resource belongs_to Organization; Rating belongs_to User and Resource
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - Resource has_many Categories through ResourceCategories; Category has_many Resources through ResourceCategories; User has_many Resources through Ratings; Resource has_many Users through Ratings
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - Resource has_many Categories through ResourceCategories, Category has_many Resources through ResourceCategories; User has_many Resources through Ratings, Resource has_many Users through Ratings
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - User has_many Resources (and vice versa) through Ratings, with the user-submittable attribute of "rating" (score of 1-5)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - Category, Organization, Resource, User
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - Category.alphabetical, Organization.alphabetical, Organization.totals_by_organization, Rating.average_rating, Rating.alphabetical_by_resource, Resource.alphabetical
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Google
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - Resource show is nested under Organization (e.g. organizations/1/resources)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - Resource new is nested under Organization (e.g. organizations/1/resources/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate