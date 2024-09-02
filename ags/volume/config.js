const audio = await ServiceWorker.import('audio')

/** @param {'speaker' | 'microphone'} type */
const vol = () => {
    const VolumeSlider = (type = 'speaker') => Widget.Slider({
        hexpand: true,
        drawValue: false,
        onChange: ({value}) => audio[type].volume = value,
        value: audio[type].bind('volume')
    })
    
    const speakerSlider = VolumeSlider('speaker')
    const micSlider = VolumeSlider('microphone')
    return Widget.Window({
        child: [speakerSlider, micSlider]
    })
}

// const audio = await Service.import('audio')

// const vol = () => {
//     const volumeIndicator = Widget.Button({
//         on_clicked: () => audio.speaker.is_muted = !audio.speaker.is_muted,
//         child: Widget.Icon().hook(audio.speaker, self => {
//             const vol = audio.speaker.volume * 100;
//             const icon = [
//                 [101, 'overamplified'],
//                 [67, 'high'],
//                 [34, 'medium'],
//                 [1, 'low'],
//                 [0, 'muted'],
//             ].find(([threshold]) => threshold <= vol)?.[1];
    
//             self.icon = `audio-volume-${icon}-symbolic`;
//             self.tooltip_text = `Volume ${Math.floor(vol)}%`;
//         }),
//     })
//     return Widget.Window({
//         child: volumeIndicator
//     })
// }

App.config({
    style: "./style.css",
    windows: [
        vol()
        // speakerSlider,
        // micSlider
    ],
})
