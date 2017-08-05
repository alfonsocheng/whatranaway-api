class PokeController < ApplicationController

  def calc
    if !(0..251).include?(params[:id].to_i)
      raise "#{params[:id]} provided must be between 1 and 251 inclusive"
    end
    require "#{Rails.root}/lib/possible_ivs_by_cp/#{params[:id]}.rb"

    all_possibilities = "Pokemon#{params[:id]}Constants::IVS_BY_CP".constantize

    if all_possibilities[params[:cp].to_i].present?
      render json: all_possibilities[params[:cp].to_i]
    else
      render json: [[nil, all_possibilities.keys.min, all_possibilities.keys.max]]
    end
  end
end
