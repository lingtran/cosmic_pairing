class Sun < Celestial
  include ActiveModel::Serialization

  def self.get_all_signs
    sun_signs = Celestial.find_by_name("sun").celestial_signs
    sun_signs.map do |sun_sign|
      {
        id: sun_sign.id,
        name: sun_sign.name
      }
    end
  end
end
