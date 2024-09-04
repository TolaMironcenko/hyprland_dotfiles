import Weather from "./Weather.js"

const win = Widget.Window({
    name: "weather",
    css: "background: transparent",
    anchor: ["top", "left"],
    child: Weather(),
})

App.config({
    style: "./style.css",
    window: [win],
})
