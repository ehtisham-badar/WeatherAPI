//
//  WeatherResponseModel.swift
//  Weather
//
//  Created by Ehtisham Badar on 22/04/2024.
//

import Foundation

// MARK: - Welcome
struct WeatherResponseModel: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Current
struct Current: Codable {
    let lastUpdatedEpoch: Double?
    let lastUpdated: String?
    let tempC: Double?
    let tempF: Double?
    let isDay: Double?
    let condition: Condition?
    let windMph, windKph: Double?
    let windDegree: Double?
    let windDir: String?
    let pressureMB: Double?
    let pressureIn: Double?
    let precipMm, precipIn, humidity, cloud: Double?
    let feelslikeC, feelslikeF: Double?
    let visKM, visMiles, uv: Double?
    let gustMph, gustKph: Double?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String?
    let icon: String?
    let code: Double?
}


// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String?
    let dateEpoch: Double?
    let day: Day?
    let astro: Astro?
    let hour: [Hour]?

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String?
    let moonPhase: String?
    let moonIllumination, isMoonUp, isSunUp: Double?

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mDoubleempC, mDoubleempF: Double?
    let avgtempC, avgtempF: Double?
    let maxwindMph: Double?
    let maxwindKph, totalprecipMm: Double?
    let totalprecipIn, totalsnowCM, avgvisKM, avgvisMiles: Double?
    let avghumidity, dailyWillItRain, dailyChanceOfRain, dailyWillItSnow: Double?
    let dailyChanceOfSnow: Double?
    let condition: Condition?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mDoubleempC = "mDoubleemp_c"
        case mDoubleempF = "mDoubleemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
    }
}

// MARK: - Hour
struct Hour: Codable {
    let timeEpoch: Double?
    let time: String?
    let tempC, tempF: Double?
    let isDay: Double?
    let condition: Condition?
    let windMph, windKph: Double?
    let windDegree: Double?
    let windDir: String?
    let pressureMB: Double?
    let pressureIn, precipMm: Double?
    let precipIn, snowCM, humidity, cloud: Double?
    let feelslikeC, feelslikeF, windchillC, windchillF: Double?
    let heatindexC, heatindexF, dewpoDoubleC, dewpoDoubleF: Double?
    let willItRain, chanceOfRain, willItSnow, chanceOfSnow: Double?
    let visKM, visMiles: Double?
    let gustMph, gustKph: Double?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case snowCM = "snow_cm"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpoDoubleC = "dewpoDouble_c"
        case dewpoDoubleF = "dewpoDouble_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String?
    let lat, lon: Double?
    let tzID: String?
    let localtimeEpoch: Double?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
