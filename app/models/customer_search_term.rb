# coding: utf-8

class CustomerSearchTerm
  attr_reader :order
  attr_reader :where_clause
  attr_reader :where_args

  def initialize(search_term)
    search_term = search_term.downcase
    @where_clause = ''
    @where_args = {}
    if search_term =~ /@/
      build_for_email_search(search_term)
    else
      build_for_name_search(search_term)
    end
  end

  def build_for_name_search(search_term)
    @where_clause << case_insensitive_search(:first_name)
    @where_args[:first_name] = starts_with(search_term)

    @where_clause << " OR #{case_insnsitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(search_term)
  end

  def case_insensitive_search(field_name)
    "lower(#{field_name} like :#{field_name}"
  end

  def starts_with(search_term)
    search_term + '%'
  end
end
