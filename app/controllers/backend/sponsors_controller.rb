class Backend::SponsorsController < Backend::BaseController
  # before_action :find_sponsor, only:[:show, :destroy, :edit, :update]
  
  # def index
  # 	@sponsors = Sponsor.all
  # end

  # def new
  # 	@sponsor = Sponsor.new
  # end

  # def create
  # 	@sponsor = Sponsor.new(sponsor_params)
  # 	if @sponsor.save
  # 		#flash[:success] = "新增成功"
  # 		redirect_to backend_sponsors_path
  # 	else
  #     render 'new'
  #   end
  	
  # end

  # def show
  	
  # end

  # def destroy
  	
  # 	@sponsor.destroy
  # 	redirect_to backend_sponsors_path
  # end

  # def edit
  	
  # end
  # def update
  	
  # 	if @sponsor.update(sponsor_params)
  #     redirect_to backend_sponsors_path
  #   else
  #     render :edit
  #   end
  # end

  private

    def collection_scope
      Sponsor
    end
  	# def find_sponsor
  	# 	@sponsor = Sponsor.find(params[:id])
  	# end

  	def object_params
    params.require(:sponsor).permit(:name, :description, :image, :link)
  	end
end
