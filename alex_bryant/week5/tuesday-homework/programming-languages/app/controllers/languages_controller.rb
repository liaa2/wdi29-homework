class LanguagesController < ApplicationController

  skip_before_action :verify_authenticity_token, raise: false

  # DELETE
  def delete
    language = Language.find params[:id]
    language.destroy
    redirect_to languages_path
  end

  #UPDATE
  def update
    language = Language.find params[:id]
    language.update(
      name: params[:name],
      description: params[:description],
      sample_hello_world: params[:sample_hello_world],
      imperative: trueOrFalse(params[:imperative]),
      object_oriented: trueOrFalse(params[:object_oriented]),
      functional: trueOrFalse(params[:functional]),
      procedural: trueOrFalse(params[:procedural]),
      generic: trueOrFalse(params[:generic]),
      reflective: trueOrFalse(params[:reflective]),
      event_driven: trueOrFalse(params[:event_driven]),
      other_paradigms: params[:other_paradigms],
      standardized: params[:standardized],
    )
    redirect_to language_path(params[:id])
  end

  #UPDATE
  def edit
    @language = Language.find params[:id]
    @checked = []
    boolean_arr = get_boolean_arr @language
    boolean_arr.each_with_index do |x, i|
      @checked[i] = x ? "checked" : ""
    end
    puts @boolean_arr
  end

  #method to check checkbox state
  def trueOrFalse state
    if state == "on"
      return true
    end
    false
  end

  # CREATE post new item
  def create
    Language.create(
      name: params[:name],
      description: params[:description],
      sample_hello_world: params[:sample_hello_world],
      imperative: trueOrFalse(params[:imperative]),
      object_oriented: trueOrFalse(params[:object_oriented]),
      functional: trueOrFalse(params[:functional]),
      procedural: trueOrFalse(params[:procedural]),
      generic: trueOrFalse(params[:generic]),
      reflective: trueOrFalse(params[:reflective]),
      event_driven: trueOrFalse(params[:event_driven]),
      other_paradigms: params[:other_paradigms],
      standardized: params[:standardized],
    )
    redirect_to languages_path
  end

  #CREATE no logic required on the form page
  def new
  end

  # READ to see the index of all
  def index
    @languages = Language.all
  end

  def get_boolean_arr lang
    boolean_arr = [
      lang.imperative,
      lang.object_oriented,
      lang.functional,
      lang.procedural,
      lang.generic,
      lang.reflective,
      lang.event_driven,
      ]
  end

  #READ to see individual page
  def show
    @language = Language.find params[:id]
    #To determine the colors shown in the
    #individual tables for paradigms
    @color_classes = []
    boolean_arr = get_boolean_arr @language
    boolean_arr.each do |x|
      if x
        @color_classes.push "success"
      else
        @color_classes.push "primary"
      end
    end
    @program_with_line_breaks = @language.sample_hello_world.split("\n")
  end

end
