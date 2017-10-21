class PicturesController < ApplicationController
    def new_form
        render("pic_templates/blank_form.html.erb")
    end
    
    def create_row
        render("pic_templates/row_creation.html.erb")
    end
    
    def index
        render("pic_templates/index_file.html.erb")
    end
    
    def show
        # Parameters: {"the_id" => "2"}
        visited_id = params["the_id"]
        p = Photo.find(visited_id)
        @the_caption = p.caption
        @the_image_url = p.source
        
        render("pic_templates/show_file.html.erb")
    end
    
    def edit_form
        render("pic_templates/edit_photo.html.erb")
    end
    
    def update_row
        render("pic_templates/row_update.html.erb")
    end
    
    def destroy_row
        render("pic_templates/photo_deletion.html.erb")
    end
        
end
