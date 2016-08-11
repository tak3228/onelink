class LinksController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]
	before_action :set_link, only: [:edit, :update]

	def new
		@link = Link.new
	end

	def edit
	end
	def update
		if @link.update(link_params)
			# 保存に成功した場合はトップページへリダイレクト
			flash[:success] = '変更を保存しました'
			redirect_to root_path 
		else
			# 保存に失敗した場合は編集画面へ戻す
			render 'edit'
		end
	end

		def create
			@link = Link.new(link_params)
			@link.user_id = current_user.id
			if @link.valid?(:url)#valid?はrailsで有効であるかどうか検証する、単独使用可。
				@link.title = @link.get_page_title
			end
			if @link.save
				flash[:success] = 'リンクが作成されました'
				redirect_to root_path
			else
				render 'new'
			end
		end

		def destroy
			@link = Link.find(params[:id])
			@link.destroy
			flash[:success] = 'リンクを削除しました'
			redirect_to :root
		end


		private

		def link_params
			params.require(:link).permit(:url, :title, :bunrui)
		end

		def set_link
			@link = Link.find(params[:id])
		end
end
