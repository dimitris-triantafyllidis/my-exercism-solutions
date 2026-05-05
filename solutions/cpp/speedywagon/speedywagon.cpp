#include "speedywagon.h"

namespace speedywagon {

    bool connection_check(const pillar_men_sensor *sensor)
    {
        return sensor != nullptr;
    }

    int activity_counter(const pillar_men_sensor *sensor_array, int n)
    {
        int total = 0;

        for (std::size_t i = 0; i < std::size_t(n); i++)
        {
            total += sensor_array[i].activity;
        }

        return total;
    }

    bool alarm_control(const pillar_men_sensor *sensor)
    {
        if (sensor == nullptr)
            return false;
        else if (sensor->activity > 0)
            return true;
        else
            return false;
    }

    bool uv_alarm(pillar_men_sensor *sensor)
    {
        if (sensor == nullptr)
            return false;
        else if (uv_light_heuristic(&(sensor->data)) > sensor->activity)
            return true;
        else
            return false;
    }

    // Please don't change the interface of the uv_light_heuristic function
    int uv_light_heuristic(std::vector<int>* data_array) {
        double avg{};
        for (auto element : *data_array) {
            avg += element;
        }
        avg /= data_array->size();
        int uv_index{};
        for (auto element : *data_array) {
            if (element > avg) ++uv_index;
        }
        return uv_index;
    }

}  // namespace speedywagon
