if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Pf1eHKp1SdbjTFfxRpKtc8Qw',
    :secret_key => 'sk_test_rjW4x9vJ9dFAr9UxNj1kUTZA'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]