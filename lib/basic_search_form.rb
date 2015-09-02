class BasicSearchForm
  include ActiveModel::Model
  def persisted?
    false
  end

  def basic_scope
    #must defined in subclass
  end

  def search
    sc = basic_scope
    self.class.searcher_fields.each do |field_name, sproc|
      if (sfv = send(field_name)).present?
        sc = sc.instance_exec(sfv, &sproc)
      end
    end
    sc
  end

  def self.searcher_fields
    @searcher_fields ||= {}
  end

  def self.search_field(fname, p)
    fname = fname.to_sym
    searcher_fields[fname] = p
    attr_accessor fname
  end
end
