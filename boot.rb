DB = Sequel.postgres('testerdb')
DB.extension :pg_array
Sequel.extension :pg_array_ops
Sequel.inflections do |inflect|
  inflect.plural(/^bonus$/i, 'bonuses')
  inflect.singular(/^bonuses/i, 'bonus')
end
