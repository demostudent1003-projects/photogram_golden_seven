class PicturesController < ApplicationController
    def new_form
        render("pic_templates/blank_form.html.erb")
    end
    
    def create_row
        # Incoming parameters from the user look like this: Parameters: {"the_source"=>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT66fn5JObSxavaBTPiFPZYIn-9UT-bOL_GRrce_eF9_j-LVxWtWQ", "the_caption"=>"pom"}
        a = Photo.new
        a.source = params["the_source"]
        a.caption = params["the_caption"]
        a.save
        @photos_now = Photo.count
        # render("pic_templates/row_creation.html.erb")
        redirect_to("/photos")
    end
    
    def index
        @all_photos = Photo.all
        render("pic_templates/index_file.html.erb")
    end
    
    def show
        # Parameters: {"the_id" => "2"}
        visited_id = params["the_id"]
        p = Photo.find(visited_id)
        @the_caption = p.caption
        @the_image_url = p.source
        @the_id = visited_id
        
        render("pic_templates/show_file.html.erb")
    end
    
    def edit_form
        # Parameters: {"an_id"=>"29"}
        editing_id = params["an_id"]
        s = Photo.find(editing_id)
        @caption = s.caption
        @image_url = s.source
        @an_id = editing_id
        render("pic_templates/edit_photo.html.erb")
    end
    
    def update_row
        # Parameters: {"the_source"=>"http://cdn.skim.gs/image/upload/v1456344012/msi/Puppy_2_kbhb4a.jpg", "the_caption"=>"a cute puppy", "some_id"=>"1"}
        updating_id = params["some_id"]
        r = Photo.find(updating_id)
        r.source = params["the_source"]
        r.caption = params["the_caption"]
        r.save
        @updated_id = updating_id
        redirect_to("/photos/#{@updated_id}")
        # render("pic_templates/row_update.html.erb")
    end
    
    def destroy_row
        # Parameters: {"toast_id"=>"542"}
        to_destroy_id = params["toast_id"]
        c = Photo.find(to_destroy_id)
        c.destroy
        @photos_remaining = Photo.count
        redirect_to("/photos")
        # render("pic_templates/photo_deletion.html.erb")
    end
        
end
