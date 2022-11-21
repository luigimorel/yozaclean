import Head from "next/head";

import Benefits from "../components/benefits";
import { benefitOne, benefitTwo } from "../components/data";
import Faq from "../components/faq";
import Footer from "../components/footer";
import Hero from "../components/hero";
import Navbar from "../components/navbar";
import SectionTitle from "../components/sectionTitle";
import Video from "../components/video";

export default function Home() {
  return (
    <>
      <Head>
        <title>
          YozaClean - Get all your cleaning done with a tap of a button
        </title>
        <meta
          name="description"
          content="YozaClean - Get all your cleaning done with a tap of a button"
        />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <Navbar />
      <Hero />
      <SectionTitle
        pretitle="YozaClean Benefits"
        title=" Why should you use YozaClean"
      >
        YozaClean is a free landing page & marketing website template for
        startups and indie projects. Its built with Next.js & TailwindCSS. And
        its completely open-source.
      </SectionTitle>
      <Benefits data={benefitOne} />
      <Benefits imgPos="right" data={benefitTwo} />
      <SectionTitle pretitle="Watch a video" title="Learn how YozaClean works">
        This section is to highlight a promo or demo video of your product.
        Analysts says a landing page with video has 3% more conversion rate. So,
        don't forget to add one. Just like this.
      </SectionTitle>
      <Video />

      <SectionTitle pretitle="FAQ" title="Frequently Asked Questions">
        Got any unanswered questions? We've got some answers for you.
      </SectionTitle>
      <Faq />
      <Footer />
      {/* <PopupWidget /> */}
    </>
  );
}
