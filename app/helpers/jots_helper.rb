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

  def latest_jot(jot)
    render 'layouts/latest_jot_card' if jot
  end

  def top_jot(category)
    render 'layouts/top_jot_card', category: category if category.top_jot
  end

  def jot_image(jot, css_class: '')
    image_tag jot.image, alt: jot.title, class: css_class if jot.image.attached?
  end

  def desktop_ordering(index)
    return 'order-md-first' unless odd_rows.include?(index + 1)
  end

  def mobile_ordering(index)
    css_class = []
    css_class << 'order-last' unless index.even?
    css_class << 'order-md-first' if odd_rows.include?(index + 1)
    css_class.join(' ')
  end

  def odd_rows
    pattern = [1, 2]

    while pattern.last <= 100
      pattern << pattern.last + 3
      pattern << pattern.last + 1
    end
    pattern
  end

  private

  def author?(jot)
    jot.author == current_user
  end
end
