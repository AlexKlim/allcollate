import React from 'react';

export default class HotelBasement extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    return (
      <>
        <section className="view-on-agoda">
          <a className="btn btn-info" href={this.props.agodaUrl} target="_blank" rel="nofollow noopener noreferrer">View on Agoda</a>
        </section>

        <section>
          {/* <PageSectionHeader title={`Similar ??? Hotels in the same area?`} /> */}
        </section>

      </>
    );
  }
}
