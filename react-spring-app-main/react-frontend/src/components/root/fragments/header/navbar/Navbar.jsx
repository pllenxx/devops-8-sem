import React from "react";
import styles from "../../../../../css/Navbar.module.css";
import "@ionic/react/css/core.css";
import Menu from "./mobileMenu/Menu";
import NavLinks from "./navLinks/NavLinks";

const Navbar = () => {
  return (
    <nav className={styles.navbar}>
      <Menu />
      <NavLinks />
    </nav>
  );
};

export default Navbar;
