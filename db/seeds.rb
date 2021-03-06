require 'csv'
require_relative '../config/environment'
require_relative 'ETL_Pipeline/ETL_Parsing/general_parser'


## AUTOMATIC SEEDING WITH GENERALIZED PARSERS ##

  # namespace_table_name = GenderInequality::GenderData

  #dataset_label: {raw_csv_filepath: '/filepath_string', dataset_db_destination: 'namespace_table_name'},
autoparsable_datasets = [
 {"raw_csv_filepath" => "db/ETL_Pipeline/raw_CSVs/gender_inequality.csv", "dataset_db_destination" => GenderInequality::GenderData},
  {"raw_csv_filepath" => "db/ETL_Pipeline/raw_CSVs/temperature-change-seasons.csv", "dataset_db_destination" => CanadianClimate::TempYear}
]
#general_parser("db/ETL_Pipeline/raw_CSVs/gender_inequality.csv", GenderInequality::GenderData)
#general_parser("db/ETL_Pipeline/raw_CSVs/temperature-change-seasons.csv", CanadianClimate::TempYear)
# autoparsable_datasets.each do |dataset|
#   p dataset
#   general_parser(dataset["raw_csv_filepath"], dataset["dataset_db_destination"])
# end



## HARD CODED SEEDING FOR WHICH GENERALIZED PARSERS ARE NOT YET AVALIBLE ##
  # DI 10-4-17 1:38 - for now I am going to leave these here, so we can run the seed file all at once. They should be duplicated inside of db/ETL_Pipeline/inflexible_parsers
# Police Killings

# Had to manually input the data on proportion of population based on race, state, etc. Couldn't get this parsing to update the data.
# CSV.foreach("db/ETL_Pipeline/raw_CSVs/us_pop.csv", headers: true, header_converters: :symbol, encoding: 'iso-8859-1:utf-8') do |row|

#   state = PoliceKillings::PkState.find_by(state: row[:state])
#   state.update_attributes(perc_of_us_pop: row[:perc_of_us_pop])
#   state.update_attributes(total_pop_2016: row[:proportion_us_pop])
# end

# CSV.foreach("db/ETL_Pipeline/raw_CSVs/updated_police_killings_2016.csv", headers: true, header_converters: :symbol, encoding: 'iso-8859-1:utf-8') do |row|

#   race = PoliceKillings::PkRace.find_or_create_by!(race: row[:race_ethnicity])
#   sex = PoliceKillings::PkSex.find_or_create_by!(sex: row[:gender])
#   city = PoliceKillings::PkCity.find_or_create_by!(city: row[:city])
#   state = PoliceKillings::PkState.find_or_create_by!(state: row[:state])
#   armed_type = PoliceKillings::PkArmedType.find_or_create_by!(armed_type: row[:armed_type])
#   classification = PoliceKillings::PkClassification.find_or_create_by!(classification: row[:classification])

#   full_name = row[:name]
#   date = row[:date]
#   age = row[:age]
#   street_address = row[:street_address]
#   law_enforcement_agency = row[:law_enforcement_agency]

#   PoliceKillings::PkDeath.find_or_create_by!({
#     name: full_name,
#     date: date,
#     age: age,
#     street_address: street_address,
#     law_enforcement_agency: law_enforcement_agency,
#     pk_race: race,
#     pk_sex: sex,
#     pk_city: city,
#     pk_state: state,
#     pk_armed_type: armed_type,
#     pk_classification: classification
#     })

#   puts row[:full_name]

# end

# Trump Debts

# counter_t = 0
# CSV.foreach("db/ETL_Pipeline/raw_CSVs/updated_trump_admin_debts.csv", headers: true, header_converters: :symbol) do |row|
#   counter_t += 1
#   print 't' if counter_t % 100 == 0

#   department = TrumpAdminDebts::Department.find_or_create_by!(name: row[:department])
#   employee = TrumpAdminDebts::Employee.find_or_create_by!(last_name: row[:last_name], first_name: row[:first_name], department: department)
#   lender = TrumpAdminDebts::Lender.find_or_create_by!(name: row[:lender_name])
#   debt_type = TrumpAdminDebts::DebtType.find_or_create_by!(description: row[:debt_type])

#   min_amount = (row[:min_amount]).to_i
#   if row[:max_amount]
#     max_amount = (row[:max_amount]).to_i
#   end

#   debt = TrumpAdminDebts::Debt.find_or_create_by!({
#     employee: employee,
#     lender: lender,
#     debt_type: debt_type,
#     min_amount: min_amount,
#     max_amount: max_amount,
#     year_incurred: row[:year_incurred],
#     rate: row[:rate],
#     term: row[:term]
#     })
# end

# # US Races Life Expectancy

# # DI note: there is an interesting ETL issue here - Year.first is the last year(2015) and Year.last is the first year(1900). Would be really cool if our system could intelligently determine which order to read the lines in based on that.
# counter_r = 0
# CSV.foreach("db/ETL_Pipeline/raw_CSVs/birth-death-rate.csv", headers: true, header_converters: :symbol) do |row|
#   counter_r += 1
#   print 'r' if counter_r % 100 == 0

#   race = USLifeExpectancy::Race.find_or_create_by!(race: row[:race])
#   sex = USLifeExpectancy::Sex.find_or_create_by!(sex: row[:sex])
#   year = USLifeExpectancy::Year.find_or_create_by!(year: row[:year])

#   age_adjusted_death_rate = row[:age_adjusted_death_rate]
#   average_life_expectancy = row[:average_life_expectancy_in_years]

#   statistic = USLifeExpectancy::Statistic.find_or_create_by!({
#     year: year,
#     race: race,
#     sex: sex,
#     age_adjusted_death_rate: age_adjusted_death_rate,
#     average_life_expectancy: average_life_expectancy
#     })

# end
