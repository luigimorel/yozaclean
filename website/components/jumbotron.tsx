interface JumbotronProps {
  header: string;
  leadingParagraph: string;
}

const Jumbotron = ({ header, leadingParagraph }: JumbotronProps) => {
  return (
    <div className=" py-8 h-auto">
      <div className="bg-overlay sm:px-12">
        <div className="  flex flex-col px-10 py-8 justify-center">
          <h1 className="text-center mb-10 sm:text-2xl">{header}</h1>
          <h6 className="text-center mb-10">{leadingParagraph}</h6>
        </div>
      </div>
    </div>
  );
};

export default Jumbotron;
