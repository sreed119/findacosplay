module UserMediaHelper
  def get_medium_options
    Medium.alphabetical.map { |m| [ m.name, m.id ] }
  end
end
