module GenderInequality
  class Query
    include DataPreparer

    def initialize(params)
      @params = params
      @descriptors = @params[:descriptors]
      @aggregations = @params[:aggregations]
    end

    def data
      if @params[:chart] == "scatter"
        scatter_data
      elsif @params[:chart] == "bar"
        bar_data # right now this is never going to happen
      elsif @params[:chart] == "pie"
        pie_data # right now this is never going to happen
      end
    end


    def scatter_data
      p "!!!!!!!!!!!!!!!!"
      perc_col = GenderInequality.aggregation_sql_snippits[@params[:aggregations]]
      p perc_col
      query = GenderInequality::GenderData
        .select("#{perc_col} AS perc, country, gender_inequality_index_2014 AS idx")
        .where("gender_inequality_index_2014 IS NOT null")
        .where("#{perc_col} IS NOT null")

      answer = []
      answer << ["perc_x"] + (0..100).to_a
      query.each do |result|
        country_row = [result.country]
        empty_array = 100.times.map { nil }
        perc_int = (result.perc * 100).floor
        empty_array[result.perc.floor] = result.idx
        country_row += empty_array
        answer << country_row
      end

      puts "this is the dataset"
      #p answer
      #generate_c3_columns(dataset, labels)

      answer
    end
     # [index, country, percentage]

    def generate_c3_columns(dataset, labels)
      label_data = {Country: "education_x"}
      x_axis = ["education_x"]
      descriptor_id = [labels[0]]
      datset = dataset.sort_by { |sub_array| sub_array.last }
      dataset.each do |sub_array|
        x_axis.push(sub_array)
      end
      dataset.each do |sub_array|
        if sub_array[0] == descriptor_id
            descriptor_id << sub_array[0]
        end
      end
      new_array = Array.new(push(x_axis, descriptor_id))
    end


    def bar_data
      thing_we_want = GenderInequality.aggregation_sql_snippits[@params[:aggregations]]
      query = GenderInequality::GenderData.select(thing_we_want + ", country").where(thing_we_want + " IS NOT null")
        .where("gender_inequality_index_2014 IS NOT null")

      dataset = query.map { |row| [row, row.country]}

      dataset = dataset.map { |sub_array| { label: sub_array[-1], amount: sub_array[-2][thing_we_want] } }
      puts "this is the bar chart data for gender inequality"
      return prepared_data(dataset)
    end

    # def scatter_data
    #   aggregator_SQL_string = GenderInequality.aggregation_sql_snippits[@params[:aggregations]]

    #   if @params[:descriptors] == "Country"
    #     query = GenderInequality::GenderData
    #     .select("gender_inequality_index_rank_2014, country, share_of_women_w_some_secondary_education_25_and_up_2005_2014")
    #     @dataset = query.map { |result| [result.country] }
    #   end
    # end
   private

    def should_condense?
      false
    end

  end
end
