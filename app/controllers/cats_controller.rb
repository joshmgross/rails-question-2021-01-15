class CatsController < ApplicationController
  def show
    cat = Cat.find(params[:id])
  end

  def update_with_query
    find_cat.name = "Tabby" # Won't work
    find_cat.save # No changes to save

    redirect_to find_cat
  end

  def update_with_local_var
    cat_to_update = find_cat
    cat_to_update.name = "Tabby" # Will work
    cat_to_update.save # Changes to save

    redirect_to cat_to_update
  end

  def update_with_memoized
    memoized_cat.name = "Tabby" # Will work
    memoized_cat.save # Changes to save

    redirect_to memoized_cat
  end

  private

  def find_cat
    Cat.find(params[:id])
  end

  def memoized_cat
    @cat ||= Cat.find(params[:id])
  end
end
