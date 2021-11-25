class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    def create
        @contact = Contact.new(contact_params)
        # saveメソッドが走る瞬間にバリデーションが実行される。
        #（成功した）時 => @contact.saveの戻り値はtrueとなり、redirect_to new_contact_path
        # バリデーションに許されなかった（失敗した）時  => @contact.saveの戻り値はfalseとなり、 render :new が実行される
        if @contact.save
            redirect_to new_contact_path
        else
            render :new 
            
        end
    end
    private
    def contact_params
        params.require(:contact).permit(:name, :email, :content)
    end
end
