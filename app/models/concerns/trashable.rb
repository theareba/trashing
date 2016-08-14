module Trashable
  extend ActiveSupport::Concern

  included do
    default_scope -> { where(trashed_at: nil) }
    scope :trashed, -> { unscoped.where("#{self.table_name}.trashed_at is not null") }
  end

  def trash!
    update_attribute :trashed_at, Time.now
  end

  def trashed?
    trashed_at.present?
  end
end
