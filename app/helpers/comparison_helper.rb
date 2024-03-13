module ComparisonHelper

  def prepare_slugs(slugs)
    slugs ||= []

    if current_user_attributes[:access][:fullComparison]
      slugs.first(User.settings.comparison[:auth_limits])
    else
      slugs.first(User.settings.comparison[:non_auth_limits])
    end
  end
end
