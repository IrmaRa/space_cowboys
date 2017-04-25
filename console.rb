require ('pry-byebug')
require_relative('bounty')

cowboy1 = Bounty.new ({
  'name' => 'Jack',
  'species' => 'Plutonian',
  'danger_level' => 'medium',
  'homeworld' => 'Pluto'
  })

cowboy1.save()

cowboy2 = Bounty.new ({
  'name' => 'bfguj',
  'species' => 'Martian',
  'danger_level' => 'low',
  'homeworld' => 'Mars'
  })

cowboy2.save

cowboy3 = Bounty.new ({
'name' => 'Mike',
'species' => 'Martian',
'danger_level' => 'high',
'homeworld' => 'Mars'
})

cowboy3.save


binding.pry
nil