import Head from "next/head";

import Benefits from "../components/benefits";
import Cta from "../components/cta";
import { benefitOne, benefitTwo } from "../components/data";
import Faq from "../components/faq";
import Footer from "../components/footer";
import Hero from "../components/hero";
import Navbar from "../components/navbar";
import PopupWidget from "../components/popupWidget";
import SectionTitle from "../components/sectionTitle";
import Video from "../components/video";

export default function Home() {
  return (
    <>
      <Head>
        <title>YonjaClean - Free Nextjs & TailwindCSS Landing Page Template</title>
        <meta
          name="description"
          content="YonjaClean is a free landing page template built with next.js & Tailwind CSS"
        />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <Navbar />
      <Hero />
      <SectionTitle
        pretitle="YonjaClean Benefits"
        title=" Why should you use this landing page"
      >
        YonjaClean is a free landing page & marketing website template for startups
        and indie projects. Its built with Next.js & TailwindCSS. And its
        completely open-source.
      </SectionTitle>
      <Benefits data={benefitOne} />
      <Benefits imgPos="right" data={benefitTwo} />
      <SectionTitle
        pretitle="Watch a video"
        title="Learn how to fullfil your needs"
      >
        This section is to highlight a promo or demo video of your product.
        Analysts says a landing page with video has 3% more conversion rate. So,
        don't forget to add one. Just like this.
      </SectionTitle>
      <Video />

      <SectionTitle pretitle="FAQ" title="Frequently Asked Questions">
        Answer your customers possible questions here, it will increase the
        conversion rate as well as support or chat requests.
      </SectionTitle>
      <Faq />
      <Cta />
      <Footer />
      <PopupWidget />
    </>
  );
}
