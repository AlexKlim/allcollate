import * as React from "react";
import cn from "classnames";

import "./styles.scss";

function PageSectionHeader({ title }) {
  return (
    <div className="page-subheader">
      <h2 className="page-title">{title}</h2>
    </div>
  );
}

export default PageSectionHeader;