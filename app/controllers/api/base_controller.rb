class Api::BaseController < ApplicationController
  layout nil

+  def authenticate
+    email = params[:email]
+    password_hash = params[:password_hash]
+
+    if email.blank? || password_hash.blank?
+      render json: { error: 'Email and password must be provided.' }, status: :bad_request
+      return
+    end
+
+    user = User.find_by(email: email)
+
+    if user.nil? || !user.authenticate(password_hash)
+      LoginAttempt.log_attempt(user_id: user&.id, ip_address: request.remote_ip, successful: false)
+      render json: { error: 'Incorrect email or password.' }, status: :unauthorized
+    else
+      LoginAttempt.log_attempt(user_id: user.id, ip_address: request.remote_ip, successful: true)
+      user.update(last_login_at: Time.current, login_count: user.login_count + 1)
+      session_token = SecureRandom.hex(10) # Assuming SecureRandom is included in the project
+      render json: { token: session_token, message: 'Login successful.' }, status: :ok
+    end
+  end
end