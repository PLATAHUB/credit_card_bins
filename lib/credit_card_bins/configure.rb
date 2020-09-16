# frozen_string_literal: true

module CreditCardBins
  module Configure
    @@accepted_bins = []
    @@accepted_brands = []
    @@accepted_types = []
    @@accepted_categories = []
    @@accepted_issuers = []
    @@accepted_countries = []

    def configure
      yield self if block_given?
    end

    def accepted_bins
      @@accepted_bins
    end

    def accepted_bins=(value)
      @@accepted_bins = value
    end

    def accepted_brands
      @@accepted_brands
    end

    def accepted_brands=(value)
      @@accepted_brands = value
    end

    def accepted_types
      @@accepted_types
    end

    def accepted_types=(value)
      @@accepted_types = value
    end

    def accepted_categories
      @@accepted_categories
    end

    def accepted_categories=(value)
      @@accepted_categories = value
    end

    def accepted_issuers
      @@accepted_issuers
    end

    def accepted_issuers=(value)
      @@accepted_issuers = value
    end

    def accepted_countries
      @@accepted_countries
    end

    def accepted_countries=(value)
      @@accepted_countries = value
    end
  end
end
