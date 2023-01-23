const moment = require("moment/moment")

exports.dateFromNow = (date) => 
{

}

exports.isNewFeed = (date) => 
{
    let currentTime = moment().add(-10, 'minute');
    let feedDate = moment(date);
    return feedDate.isAfter(currentTime);
}