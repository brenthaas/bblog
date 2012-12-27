class NotesController < ApplicationController
  before_filter :authorize_or_redirect!, except: [:index, :show]
  
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find_by_id(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(params[:note])
    if note.save
      redirect_to note_path(note)
    else
      render :new, message: "Unable to create note"
    end
  end
end
