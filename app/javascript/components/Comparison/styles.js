import { makeStyles } from '@material-ui/core/styles'

export const useStyles = makeStyles({
    page: {
      minWidth: '100%'
    },
    content: {
      width: '100%'
    },
    pageHeader: {
      display: 'flex',
      marginTop: '50px',
      display: 'flex',
      flexWrap: 'wrap',
      alignItems: 'center'
    },
    titleBox: {
      width: 'fit-content'
    },
    title: {
      fontStyle: 'normal',
      fontWeight: 'normal',
      fontSize: '34px',
      lineHeight: '40px',
      color: 'black'
    },
    searchBox: {
      width: '6000px',
    },
    noHotelsBox: {
      position: 'absolute',
      minWidth: '100%;',
      left: 0,
      textAlign: 'center',
      backgroundColor: '#F5F7FB'
    },
    noHotelsTitle: {
      marginTop: '15%'
    },
    contentBox: {
      alignSelf: 'flex-center',
      width: '100%',
      padding: '0px',
      height: '105%',
      display: 'flex',
      flexWrap: 'wrap',
      justifyContent: 'space-around',
      alignItems: 'center',
      border: '1px solid #B2B2B2',
      borderRadius: '4px',
      backgroundColor: '#FFFFFF'
    },
    card: {
      width: '100%',
      height: '100%',
      maxWidth: '345px',
      maxHeight: '345px',
    },
    cardHeader: {
      align: 'center'
    },
    media: {
      height: '30%',
      width: '50%',
      marginLeft: '25%',
      paddingTop: '56.25%',
      borderRadius: '4px'
    },
    removeButton: {
      '&:hover': {
        cursor: 'pointer'
      }
    },
    table: {
      borderTopWidth: 1,
      marginTop: '50px'
    },
    row: {
      border: '1px;',
      borderWidth: '1px;',
      borderColor: 'grey;',
      borderStyle: 'solid;',
      borderRadius: '4px;',
    },
    cell: {
      minWidth: '345px;'
    },
    leftColumnHeader: {
      position: 'sticky',
      left: '0px',
      backgroundColor: '#F5F7FB'
    },
    noHotelsBox: {
      minWidth: '100%;',
      marginTop: '25%'
    },
    headerCardBox: {
      display: 'flex',
      flexWrap: 'wrap',
      justifyContent: 'space-around',
      alignItems: 'center',
      width: '100%',
      height: '100%',
    },
    leftColumn: {
      position: 'sticky',
      left: '0px',
      color: 'black',
      background: '#FFFFFF',
      zIndex: '9999999',
      width: 'fit-content',
      minWidth: '150px',
      border: '1px solid #B2B2B2',
      boxSizing: 'border-box',
      borderRadius: '4px'
    },
    dataCell: {
      borderRight: '1px solid #ececec'
    },
    resultTableRow: {
      background: '#FFFFFF',
      border: '1px solid #B2B2B2',
      boxSizing: 'border-box',
      borderRadius: '4px'
    }
  })