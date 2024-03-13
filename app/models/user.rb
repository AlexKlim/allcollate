class User < ApplicationRecord
  COMPARE_LIMIT_FOR_NON_AUTH = 3
  COMPARE_LIMIT_FOR_AUTH = 10

  enum subscription_plan: { general: 'general', basic: 'basic', basic_plus: 'basic_plus', pro: 'pro' }, _prefix: :subscription_plan

  def self.settings
    OpenStruct.new({
      comparison: {
        auth_limits: COMPARE_LIMIT_FOR_AUTH,
        non_auth_limits: COMPARE_LIMIT_FOR_NON_AUTH
      }
    })
  end
end
