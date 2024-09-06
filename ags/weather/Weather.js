import Weather from "./weather_service.js"

export default () => Widget.Box(
    { 
        class_name: "weather",
        css: "min-height: 2px; min-width: 2px;",
    },
    Widget.Box(
        { class_name: "list" },
        Widget.Box(
            {
                class_name: "weater-box-yesterday",
                vertical: true
            },
            Widget.Box(
                {
                    class_name: "horizontal",
                    css: "padding: 0 10px 10px 10px;"
                },
                Widget.Label({
                    class_name: "title",
                    wrap: false,
                    label: "     0.77mm  ↑ 10°C  ↓ 4°C  THU"
                })
            ),
            Widget.Box(
                { class_name: "horizontal" },
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "⛅️",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  0.26mm",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "⛅️",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  0.26mm",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "⛅️",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        // label: "  0.26mm",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
            )
        ),
        Widget.Box(
            {
                class_name: "weather-box-today",
                vertical: true,
            },
            Widget.Box(
                {
                    class_name: "horizontal",
                    css: "color: black;margin-top: 0;",
                    // space_evenly: true
                },
                Widget.Label({
                    class_name: "title",
                    css: "color: black;font-size: 25px;",
                    wrap: true,
                    // label: "",
                    hpack: "start",
                    setup: self => self.hook(Weather, () => {
                        Weather.weatherData
                        self.label = `${Weather._temperatureWeather.current_condition[0].weatherCode}`
                    })
                }),
                Widget.Box({hexpand: true}),
                Widget.Label({
                    class_name: "title",
                    css: "color: black;margin-right: 10px;font-size: 20px;",
                    wrap: true,
                    // label: "↑ 10  ↓ 4  FRI",
                    hpack: "end",
                    setup: self => self.hook(Weather, () => {
                        // self.label = "hello world"
                        print(Weather.weatherData)
                        self.label = `↑ ${Weather._temperatureWeather.weather[0].maxtempC} ↓ ${Weather._temperatureWeather.weather[0].mintempC} ${Weather._temperatureWeather.weather[0].date}`
                    }),
                })
            ),
            Widget.Box(
                {
                    class_name: "horizontal",
                    css: "margin: 10px 0 10px 0;"
                },
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                        css: "color: black;"
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Box({vexpand: true}),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                        css: "color: black;"
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Box({vexpand: true}),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                        css: "color: black;"
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Box({vexpand: true}),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                        css: "color: black;"
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Box({vexpand: true}),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                        css: "color: black;"
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Box({vexpand: true}),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                        css: "color: black;"
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Box({vexpand: true}),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
                Widget.Box(
                    {
                        class_name: "weather-box-hour",
                        vertical: true,
                        css: "color: black;"
                    },
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "18h",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "",
                    }),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "6°C",
                    }),
                    Widget.Box({vexpand: true}),
                    Widget.Label({
                        class_name: "title",
                        wrap: true,
                        hpack: "center",
                        label: "  5 kph",
                    }),
                ),
            )
        ),
        Widget.Box(
            {
                class_name: "weather-box",
                vertical: true,
            },
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "MON",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "10h",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "⛅️",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "10°C",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                // label: "  0.26mm",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "↑ 10°C",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "↓ 4°C",
            })
        ),
        Widget.Box(
            {
                class_name: "weather-box",
                vertical: true,
            },
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "TUE",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "10h",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "⛅️",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "10°C",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                // label: "  0.26mm",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "↑ 10°C",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "↓ 4°C",
            })
        ),
        Widget.Box(
            {
                class_name: "weather-box",
                vertical: true,
            },
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "WED",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "10h",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "⛅️",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "10°C",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                // label: "  0.26mm",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "↑ 10°C",
            }),
            Widget.Label({
                class_name: "title",
                wrap: true,
                hpack: "center",
                label: "↓ 4°C",
            })
        ),
    )
)