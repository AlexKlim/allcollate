import * as React from "react";
import ReactEcharts from 'echarts-for-react';
import { useComparisonContext } from "./ComparisonProvider";
import Typography from '@material-ui/core/Typography';
import { useStyles } from './styles'

export default function RatesComparisonChart() {
  const classes = useStyles()
  const { hotels } = useComparisonContext()

  const getOption = () => {
    let dates = []
    const data = hotels.map(hotel => {
      const sortedRates = _.sortBy(hotel.rates, 'actual_on')
      const hotelDates = sortedRates.map(item => item.actual_on)
      dates = _.unionWith(dates, hotelDates, _.isEqual)
      return {
        rates: hotel.rates.map(item => item.daily_rate),
        hotelName: hotel.name
      }
    })

    return ({
      legend: {
        data: data.map(i => i.hotelName)
      },
      tooltip: {
        trigger: 'axis',
        position: function (pt) {
          return [pt[0], '10%'];
        }
      },
      toolbox: {
        feature: {
          saveAsImage: {
            title: 'Download',
            name: `Rates`
          }
        }
      },
      xAxis: {
        type: 'category',
        nameLocation: 'middle',
        boundaryGap: false,
        data: dates.sort(),
      },
      yAxis: {
        type: 'value',
        name: 'Rate ($)',
      },
      dataZoom: [{
        type: 'inside',
        start: 0,
      }, {
        start: 0,
        end: 10,
        handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
        handleSize: '80%',
        handleStyle: {
          color: '#fff',
          shadowBlur: 3,
          shadowOffsetX: 2,
          shadowOffsetY: 2
        }
      }],
      series: data.map(i => (
        {
          name: i.hotelName,
          type: 'line',
          smooth: true,
          showSymbol: false,
          data: i.rates
        }
      ))
    });
  }

  return (
    <div className={classes.graphBlock}>
      <Typography variant="h6">
        Dailry Rates History
      </Typography>
      <ReactEcharts
        option={getOption()}
        notMerge={true}
      />
    </div>
  );
}