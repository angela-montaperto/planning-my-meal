module MenuHelper
  def selected_menu(path_array, opts = {})
    # leave split to handle ambiguity in path with search queries

    opts[:active_class] ||= 'active'
    opts[:disactive_class] ||= ''

    path_array = [path_array] unless path_array.is_a? Array

    return if opts[:excludes].presence&.any? { |path| request.fullpath.split("?").first.eql?(path) }

    return if opts[:skip_all].presence

    if opts[:start_with]
      return opts[:active_class] if path_array.any? { |path| request.fullpath.start_with? path }
    elsif opts[:first_level]
      return opts[:active_class] if path_array.any? { |path| request.fullpath.split("?").first.split("/")[0..2].join("/").eql?(path) }
    elsif path_array.any? { |path| request.fullpath.split("?").first.eql?(path) }
      return opts[:active_class]
    end
    opts[:disactive_class]
  end
end
