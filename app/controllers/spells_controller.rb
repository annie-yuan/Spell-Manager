class SpellsController < ApplicationController
  def index
  #    @spells = Spell.all
      @spells = Spell.order_by params[:order_by]
 #     @role_class = RoleClass.all
#       ary = Array.new
#       @spells.find_each do |role_class|
#            role_classes = @role_class.find(role_class.id)
#            ary.push(role_classes)
#       end
#       @role_classes = ary
  end

  def create
    @spell = Spell.new(spell_params)
    if @spell.save
      flash[:notice] = 'Successfully added ' + @spell.name
      redirect_to @spell
    else
      render :new
    end
  end

  def new
     @spell = Spell.new
  end

  def edit
      @spell = Spell.find params[:id] 
  end

  def show
      @spell = Spell.find params[:id] 
  end

  def update
    @spell = Spell.find(params[:id])  
    if @spell.update(spell_params)
      flash[:notice] = 'Successfully updated ' + @spell.name
      redirect_to @spell
    else
      render :edit
    end 
  end

  def destroy
    @spell = Spell.find(params[:id])  
    if @spell.destroy
        flash[:notice] = 'Successfully deleted ' + @spell.name
    else
        flash[:notice] = 'Unable to delete ' + @spell.name
    end
    redirect_to spells_url 
  end

  def add_spell_to_book
  end
    private
    # Only allow a trusted parameter "white list" through.
    def spell_params
      # params is a hashtable.  It should have in it a key of :book.
      # The value for the :book key is another hash.
      # If params does not contain the key :book, an exception is raised.  
      # Only the "book" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of :title, :year, :author_id
      sp = params.require(:spell).permit(:name, :level, :school_id, :concentration, :role_class_ids => [])
      sp[:role_class_ids] = sp[:role_class_ids].reject { |c| c.empty? }        
      return sp  
    
    end
end
