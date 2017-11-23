/* MDESIGN MORE -- anfang */
/* normaler Zusatand */
image_more_normal = new Image();
image_more_normal.src = "../Images/mdesign_more_normal.gif";
/* hover Zustand */
image_more_hover = new Image();
image_more_hover.src = "../Images/mdesign_more_hover.gif";
/* gedrückter Zustand */
image_more_press = new Image();
image_more_press.src = "../Images/mdesign_more_press.gif";
/* MDESIGN MORE -- ende */

/* TRIAL VERSION -- anfang */
/* normaler Zusatand */
image_trial_normal = new Image();
image_trial_normal.src = "../Images/free_trial_version_normal.gif";
/* hover Zustand */
image_trial_hover = new Image();
image_trial_hover.src = "../Images/free_trial_version_hover.gif";
/* gedrückter Zustand */
image_trial_press = new Image();
image_trial_press.src = "../Images/free_trial_version_press.gif";
/* TRIAL VERSION -- ende */

/* ORDER ONLINE -- anfang */
/* normaler Zusatand */
image_order_normal = new Image();
image_order_normal.src = "../Images/order_online_normal.gif";
/* hover Zustand */
image_order_hover = new Image();
image_order_hover.src = "../Images/order_online_hover.gif";
/* gedrückter Zustand */
image_order_press = new Image();
image_order_press.src = "../Images/order_online_press.gif";
/* ORDER ONLINE -- ende */

/* CONTACT US -- anfang */
/* normaler Zusatand */
image_contact_normal = new Image();
image_contact_normal.src = "../Images/contact_us_normal.gif";
/* hover Zustand */
image_contact_hover = new Image();
image_contact_hover.src = "../Images/contact_us_hover.gif";
/* gedrückter Zustand */
image_contact_press = new Image();
image_contact_press.src = "../Images/contact_us_press.gif";
/* CONTACT US -- ende */

/* TRIAL VERSION 2 -- anfang */
/* normaler Zusatand */
image_trial_normal_2 = new Image();
image_trial_normal_2.src = "../Images/free_trial_version_2_normal.gif";
/* hover Zustand */
image_trial_hover_2 = new Image();
image_trial_hover_2.src = "../Images/free_trial_version_2_hover.gif";
/* gedrückter Zustand */
image_trial_press_2 = new Image();
image_trial_press_2.src = "../Images/free_trial_version_2_press.gif";
/* TRIAL VERSION 2 -- ende */


/* MDESIGN MEHR -- anfang */
/* normaler Zusatand */
image_mehr_normal = new Image();
image_mehr_normal.src = "../Images/mdesign_mehr_normal.gif";
/* hover Zustand */
image_mehr_hover = new Image();
image_mehr_hover.src = "../Images/mdesign_mehr_hover.gif";
/* gedrückter Zustand */
image_mehr_press = new Image();
image_mehr_press.src = "../Images/mdesign_mehr_press.gif";
/* MDESIGN MEHR -- ende */


/* GRATIS TESTEN -- anfang */
/* normaler Zusatand */
image_gratis_testen_normal = new Image();
image_gratis_testen_normal.src = "../Images/gratis_testen_normal.gif";
/* hover Zustand */
image_gratis_testen_hover = new Image();
image_gratis_testen_hover.src = "../Images/gratis_testen_hover.gif";
/* gedrückter Zustand */
image_gratis_testen_press = new Image();
image_gratis_testen_press.src = "../Images/gratis_testen_press.gif";
/* GRATIS TESTEN -- ende */

/* ONLINE KAUFEN -- anfang */
/* normaler Zusatand */
image_online_kaufen_normal = new Image();
image_online_kaufen_normal.src = "../Images/online_kaufen_normal.gif";
/* hover Zustand */
image_online_kaufen_hover = new Image();
image_online_kaufen_hover.src = "../Images/online_kaufen_hover.gif";
/* gedrückter Zustand */
image_online_kaufen_press = new Image();
image_online_kaufen_press.src = "../Images/online_kaufen_press.gif";
/* ONLINE KAUFEN -- ende */

/* KONTAKTIEREN -- anfang */
/* normaler Zusatand */
image_kontaktieren_normal = new Image();
image_kontaktieren_normal.src = "../Images/kontaktieren_normal.gif";
/* hover Zustand */
image_kontaktieren_hover = new Image();
image_kontaktieren_hover.src = "../Images/kontaktieren_hover.gif";
/* gedrückter Zustand */
image_kontaktieren_press = new Image();
image_kontaktieren_press.src = "../Images/kontaktieren_press.gif";
/* KONTAKTIEREN -- ende */


/**
 * Diese Methode wird zum Bildwechsel benutzt
 */
function changeImage(imageName,changeImageName)
{
  document.images[imageName].src = eval(changeImageName+ ".src")
}