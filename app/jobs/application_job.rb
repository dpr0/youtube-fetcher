class ApplicationJob < ActiveJob::Base
  around_perform :with_db_connection

  private

  def with_db_connection
    ActiveRecord::Base.connection_pool.with_connection do
      yield
    end
  end
end
