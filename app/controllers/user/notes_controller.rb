class User::NotesController < ApplicationController
 skip_before_action :verify_authenticity_token
  def create
    fish = Fish.find(note_params[:fish_id]).notes.new
    fish.body = note_params[:note]
    redirect_to request.referer if fish.save
  end

  private

  def note_params
    params.permit(:note, :fish_id)
  end
end
