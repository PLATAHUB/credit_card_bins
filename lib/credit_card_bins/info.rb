module CreditCardBins; end

class CreditCardBins::Info
  attr_accessor :bins, :brands, :types, :issuers, :countries

  def initialize
    @yml_files = File.join(File.dirname(__FILE__), '..', 'data', '**', '*.yml')
    @bins = []
    @brands = []
    @types = []
    @issuers = []
    @countries = []
    setup_info
  end

  def setup_info
    @data = []

    Dir.glob(@yml_files) do |filename|
      @data = YAML.load_file(filename)

      @data.each do |_key, value|
        @bins << value['bin']
        @brands << value['brand']
        @types << value['type']
        @issuers << value['issuer']
        @countries << value['country']['alpha_3']
      end
    end

    @bins = @bins.compact.uniq
    @brands = @brands.compact.uniq
    @types = @types.compact.uniq
    @issuers = @issuers.compact.uniq
    @countries = @countries.compact.uniq
  end
end
