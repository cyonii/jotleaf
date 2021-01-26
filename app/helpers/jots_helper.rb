module JotsHelper
  def new_jot_button
    blind_paths = [
      login_path, new_user_path,
      new_jot_path
    ]
    return if blind_paths.include?(request.path)

    render 'layouts/new_jot_button'
  end

  def author_controls(jot)
    render 'author_controls' if author?(jot)
  end

  private

  def author?(jot)
    jot.author == current_user
  end
end
