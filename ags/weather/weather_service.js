import Service from 'resource:///com/github/Aylur/ags/service.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';

class Weather extends Service {
    static { Service.register(this); }

    constructor() {
        super();
        this._temperatureWeather = null;
        this._tooltip = null;
    }

    get weatherData() {
        this._temperatureWeather = JSON.parse(Utils.exec(['python', "/home/tola/dotfiles/ags/weather/wttr.py"])) // .then(temp => {console.log(temp)}).catch(print);
        return this._temperatureWeather
    }

    // get temperatureWeather() {
    //     return this._temperatureWeather;
    // }
    // setTemperatureWeather(temp) {
    //     this._temperatureWeather = temp;
    //     this.emit('changed');
    // }

    // get tooltip() {
    //     return this._tooltip;
    // }
    // setTooltip(text) { this._tooltip = text }
}

export default new Weather();