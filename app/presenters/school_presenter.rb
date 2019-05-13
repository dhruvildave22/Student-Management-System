class SchoolPresenter < ApplicationPresenter
  def initialize(model, view)
    @model = model
    @view = view
  end

  def info
   "#{s_name}" 
  end

  private

  def methode_missing(*args, &block)
    @model.send(*args, &block)
  end

end