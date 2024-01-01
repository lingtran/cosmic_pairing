class Sign < ApplicationRecord
    enum element: {
        air: 0,
        earth: 1,
        fire: 2,
        water: 3
    }

    enum modality: {
        cardinal: 0,
        fixed: 1,
        mutable: 2
    }

    validates :element, presence: true
    validates :modality, presence: true
    validates :name, presence: true
end
