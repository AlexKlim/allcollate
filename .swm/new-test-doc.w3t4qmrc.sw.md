---
title: New Test Doc
---
<SwmSnippet path="/app/controllers/home_controller.rb" line="1">

---

This code snippet defines a `HomeController` class that inherits from `ApplicationController`. It contains a `ping` method that renders a JSON response with a `status` key set to 'ok' and a status code of 200 OK.

```ruby
class HomeController < ApplicationController
	def ping
		render json: { status: 'ok' }, status: :ok
	end
end
```

---

</SwmSnippet>

<SwmSnippet path="/app/controllers/application_controller.rb" line="1">

---

This code snippet defines a class `ApplicationController` that inherits from `ActionController::Base`. It includes a `rescue_from` statement that catches `ActiveRecord::RecordNotFound` exceptions and handles them by calling the `not_found` method.

```ruby
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
```

---

</SwmSnippet>

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBYWxsY29sbGF0ZSUzQSUzQUFsZXhLbGlt" repo-name="allcollate"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
