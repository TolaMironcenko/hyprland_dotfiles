import { Media } from "./Media.js"

const win = Widget.Window({
    name: "mpris",
    css: "border-radius: 16px;",
    anchor: ["top", "right"],
    child: Media(),
})

App.config({
    style: "./style.css",
    windows: [win],
})
