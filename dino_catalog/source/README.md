## DinoCatalog

To setup/run: `bundle && ./main.rb`

### Supported Query Grammar:

```

  # Filters:

    where(foo: 'bar')
    where(a: 1).with(b: 2)
    where(x: 'y').and(z: 'woot')

  # Structure:

    { :variable => :equals_this }
    { :variable => { :< => :less_than_this } }
    { :variable => [ '>=', :greater_than_or_equal_to_this ] }

```

### Examples:

```

  # View all dinosaurs:

  DinoCatalog > entries
  => [#<DinoDex::Dinosaur:0x007fc23bbaf8d8
    @continent=:africa,
    @description=nil,
    @diet=:herbivore,
    @genus=:abrictosaurus,
    @locomotion_type=:biped,
    @period=:jurassic,
    @weight=100>,
   #<DinoDex::Dinosaur:0x007fc23bbae550
    @continent=:africa,
    @description=nil,
    @diet=:carnivore,
    @genus=:afrovenator,
    @locomotion_type=:biped,
    @period=:jurassic,
    @weight=nil>,
    ...]

# Find with trait:

  DinoCatalog > where('weight' => 6000)
  => [#<DinoDex::Dinosaur:0x007fc23bb0c250
    @continent=:europe,
    @description="One of the only known dinosaurs with a fish-only diet.",
    @diet=:piscivore,
    @genus=:baryonyx,
    @locomotion_type=:biped,
    @period=:early_cretaceous,
    @weight=6000>]

# Chain filters:

  DinoCatalog > where(diet: 'carnivore').and(weight: ['>', 5000])
  => [#<DinoDex::Dinosaur:0x007fc23bb9e240
    @continent=:africa,
    @description=nil,
    @diet=:carnivore,
    @genus=:suchomimus,
    @locomotion_type=:biped,
    @period=:cretaceous,
    @weight=10400>,
   #<DinoDex::Dinosaur:0x007fc23baff168
    @continent=:south_america,
    @description="Largest hunter and also the coolest ever.",
    @diet=:carnivore,
    @genus=:giganotosaurus,
    @locomotion_type=:biped,
    @period=:late_cretaceous,
    @weight=30420>,
   #<DinoDex::Dinosaur:0x007fc23bafd4d0
    @continent=:asia,
    @description=nil,
    @diet=:carnivore,
    @genus=:yangchuanosaurus,
    @locomotion_type=:biped,
    @period=:oxfordian,
    @weight=7200>]

```
