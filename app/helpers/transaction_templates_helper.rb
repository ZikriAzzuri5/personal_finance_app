module TransactionTemplatesHelper
  def reccuring_type_select_options
    TransactionTemplate::SCHEDULE_TYPE_LIST.map { |list| list }
  end
end
